require 'rails_helper'

RSpec.describe CreateContentsJsonCacheJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  describe '#perform_later' do
    let!(:content) { create :content }

    it 'Job is queued without parameter' do
      expect do
        CreateContentsJsonCacheJob.perform_later
      end.to have_enqueued_job
    end

    it 'Job is queued with parameter' do
      expect do
        CreateContentsJsonCacheJob.perform_later content
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      expect { CreateContentsJsonCacheJob.perform_now }.not_to raise_error
    end
  end
end
