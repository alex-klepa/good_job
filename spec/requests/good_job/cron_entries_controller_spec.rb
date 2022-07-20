# frozen_string_literal: true
require 'rails_helper'

describe GoodJob::CronEntriesController, type: :request do
  around do |example|
    orig_value = ActionController::Base.allow_forgery_protection
    ActionController::Base.allow_forgery_protection = false
    example.call
    ActionController::Base.allow_forgery_protection = orig_value
  end

  describe 'PUT #toggle' do
    describe 'when cron is enabled' do
      it 'disables cron' do
        cron_entry = GoodJob::CronEntry.find(:example)
        expect do
          put good_job.toggle_cron_entry_path(cron_key: 'example')
        end.to change { cron_entry.enabled? }.from(true).to(false)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
