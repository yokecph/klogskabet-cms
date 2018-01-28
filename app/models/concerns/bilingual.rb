module Bilingual
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :bilingual_association_names

    # define which associations must also be bilingual
    # for the receiver to be bilingual (association classes
    # must also include the Bilingual concern)
    def bilingual_associations(*associations)
      @bilingual_association_names = associations
    end
  end

  # whether all da/en attributes are present in the receiver
  # and in named associations
  def bilingual?
    bilingual = self
      .attributes
      .select { |key, value| key =~ /_(da|en)$/ }
      .all? { |key, value| value.present? }

    return false unless bilingual

    (self.class.bilingual_association_names || []).all? do |assoc|
      self.__send__(assoc).all?(&:bilingual?)
    end
  end
end
