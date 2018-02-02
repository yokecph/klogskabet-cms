require 'rails_helper'

RSpec.describe "API/Devices", type: :request do
  describe "GET /api/devices/:name" do
    let(:device) { create :device, kind: :screen }
    let(:theme) { create :theme }

    # invocable after a request has been made
    let(:json) { JSON.load(response.body) }

    context "as unregistered device" do
      before { get api_device_path("no-device", format: :json) }

      it "returns 404 with error message" do
        expect(response).to have_http_status(404)
        expect(json).to match_json_expression({ error: String })
      end
    end

    context "as device with no content" do
      before { get api_device_path(device.name, format: :json) }

      it "returns 404 with error message" do
        expect(response).to have_http_status(404)
        expect(json).to match_json_expression({ error: String })
      end
    end

    context "as device with unpresentable content" do
      # gallery without any images => unpresentable
      let(:gallery) { create :gallery, theme: theme }

      before {
        device.update_attribute(:content, gallery)
        get api_device_path(device.name, format: :json)
      }

      it "returns 404 with error message" do
        expect(response).to have_http_status(404)
        expect(json).to match_json_expression({ error: String })
      end
    end

    context "with gallery content assigned" do
      let(:gallery) do
        create :gallery, :with_images, theme: theme
      end

      before {
        device.update_attribute(:content, gallery)
        get api_device_path(device.name, format: :json)
      }

      it "returns gallery content as json" do
        expect(json).to match_json_expression({
          id: Integer,
          name: gallery.name,
          theme_color: theme.color,
          kind: "gallery",
          bilingual: wildcard_matcher,
          images: [
            {
              id: Integer,
              title_da: String,
              title_en: String,
              description_da: String,
              description_en: String,
              description_html_da: String,
              description_html_en: String,
              source_da: String,
              source_en: String,
              url: %r{https?://.*?\.jpg},
              checksum: String
            }.ignore_extra_keys!
          ].ignore_extra_values!
        }.ignore_extra_keys!)
      end
    end

    context "with playlist content assigned" do
      let(:device) { create :device, kind: :audio }

      let(:playlist) do
        create :playlist, :with_tracks
      end

      before {
        device.update_attribute(:content, playlist)
        get api_device_path(device.name, format: :json)
      }

      it "returns playlist content as json" do
        expect(json).to match_json_expression({
          id: Integer,
          name: playlist.name,
          kind: "playlist",
          tracks: [
            {
              id: Integer,
              title: String,
              url: %r{https?://.*?\.mp3},
              checksum: String
            }.ignore_extra_keys!
          ].ignore_extra_values!
        }.ignore_extra_keys!)
      end
    end

    context "with quiz content assigned" do
      let(:quiz) do
        create :quiz, :with_options, theme: theme
      end

      before {
        device.update_attribute(:content, quiz)
        get api_device_path(device.name, format: :json)
      }

      it "returns quiz content as json" do
        expect(json).to match_json_expression({
          id: Integer,
          name: quiz.name,
          theme_color: theme.color,
          kind: "quiz",
          bilingual: wildcard_matcher,
          title_da: String,
          title_en: String,
          subtitle_da: String,
          subtitle_en: String,
          options: [
            {
              id: Integer,
              option_da: String,
              option_en: String,
              answer_da: String,
              answer_en: String
            }.ignore_extra_keys!
          ].ignore_extra_values!
        }.ignore_extra_keys!)
      end
    end

    context "with timeline content assigned" do
      let(:timeline) do
        create :timeline, :with_intervals_and_images, theme: theme
      end

      before {
        device.update_attribute(:content, timeline)
        get api_device_path(device.name, format: :json)
      }

      it "returns timeline content as json" do
        expect(json).to match_json_expression({
          id: Integer,
          name: timeline.name,
          theme_color: theme.color,
          kind: "timeline",
          bilingual: wildcard_matcher,
          title_da: String,
          title_en: String,
          intervals: [
            {
              id: Integer,
              subtitle_da: String,
              subtitle_en: String,
              description_da: String,
              description_en: String,
              description_html_da: String,
              description_html_en: String,
              images: [
                {
                  description_da: String,
                  description_en: String,
                  source_da: String,
                  source_en: String,
                  url: %r{https?://.*?\.jpg},
                  checksum: String
                }.ignore_extra_keys!
              ].ignore_extra_values!
            }.ignore_extra_keys!
          ].ignore_extra_values!
        }.ignore_extra_keys!)
      end
    end

    context "with video gallery content assigned" do
      let(:video_gallery) do
        create :video_gallery, :with_videos, theme: theme
      end

      before {
        device.update_attribute(:content, video_gallery)
        get api_device_path(device.name, format: :json)
      }

      it "returns video gallery content as json" do
        expect(json).to match_json_expression({
          id: Integer,
          name: video_gallery.name,
          theme_color: theme.color,
          kind: "video_gallery",
          bilingual: wildcard_matcher,
          videos: [
            {
              id: Integer,
              title_da: String,
              title_en: String,
              description_da: String,
              description_en: String,
              description_html_da: String,
              description_html_en: String,
              subtitle_da: String,
              subtitle_en: String,
              youtube_id: String
            }.ignore_extra_keys!
          ].ignore_extra_values!
        }.ignore_extra_keys!)
      end
    end
  end
end
