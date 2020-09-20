require 'rails_helper'

RSpec.describe CreateSeasonsJsonCacheJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  describe '#perform_later' do
    let!(:season) { create :season }

    it 'Job is queued without parameter' do
      expect do
        CreateSeasonsJsonCacheJob.perform_later
      end.to have_enqueued_job
    end

    it 'Job is queued with parameter' do
      expect do
        CreateSeasonsJsonCacheJob.perform_later season
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      expect { CreateSeasonsJsonCacheJob.perform_now }.not_to raise_error
    end
  end
end
