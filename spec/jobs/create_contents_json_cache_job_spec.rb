require 'rails_helper'

RSpec.describe CreateContentsJsonCacheJob, type: :job do
  describe '#perform_later' do
    let!(:content) { create :content }

    it 'Job is queued without parameter' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CreateContentsJsonCacheJob.perform_later
      end.to have_enqueued_job
    end

    it 'Job is queued with parameter' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CreateContentsJsonCacheJob.perform_later content
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      ActiveJob::Base.queue_adapter = :test
      expect { CreateContentsJsonCacheJob.perform_now }.not_to raise_error
    end
  end
end
