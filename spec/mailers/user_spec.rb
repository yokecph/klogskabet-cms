require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome mail" do
    let(:user) { create :user }

    context "with no optional stuff" do
      let(:mail) { UserMailer.welcome(user, "foobar-token") }

      it "renders the headers" do
        expect(mail.subject).to eq("Welcome to Klogskabet CMS")
        expect(mail.to).to eq([user.email])
        expect(mail.from).to eq(["no-reply@klogskabet.yoke.dk"])
      end

      it "renders a set-password link in the body" do
        expect(mail.body.encoded).to match %r{/users/password/edit\.\d+\?reset_password_token=foobar-token}
      end
    end

    context "with an optional message" do
      let(:mail) { UserMailer.welcome(user, "foobar-token", "Hello, world") }

      it "renders the headers" do
        expect(mail.subject).to eq("Welcome to Klogskabet CMS")
        expect(mail.to).to eq([user.email])
        expect(mail.from).to eq(["no-reply@klogskabet.yoke.dk"])
      end

      it "renders the message in the body" do
        expect(mail.body.encoded).to match %r{<p>\s*Hello, world\s*</p>}
      end

      it "renders a set-password link in the body" do
        expect(mail.body.encoded).to match %r{/users/password/edit\.\d+\?reset_password_token=foobar-token}
      end
    end

    context "with the optional reply-to" do
      let(:sender) { build :user, email: "existing-user@example.com" }
      let(:mail) { UserMailer.welcome(user, "foobar-token", "", sender) }

      it "renders the headers" do
        expect(mail.subject).to eq("Welcome to Klogskabet CMS")
        expect(mail.to).to eq([user.email])
        expect(mail.from).to eq(["no-reply@klogskabet.yoke.dk"])
        expect(mail.reply_to).to eq(["existing-user@example.com"])
      end

      it "renders a set-password link in the body" do
        expect(mail.body.encoded).to match %r{/users/password/edit\.\d+\?reset_password_token=foobar-token}
      end
    end
  end

end
