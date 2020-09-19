require 'rails_helper'

RSpec.describe CreatePurchasesJsonCacheJob, type: :job do
  describe '#perform_later' do
    let!(:user) { create :user }

    it 'Job is queued with parameter' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CreatePurchasesJsonCacheJob.perform_later user
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      ActiveJob::Base.queue_adapter = :test
      expect { CreatePurchasesJsonCacheJob.perform_now user }.not_to raise_error
    end
  end
end
