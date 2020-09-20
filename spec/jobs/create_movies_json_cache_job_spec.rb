require 'rails_helper'

RSpec.describe CreateMoviesJsonCacheJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  describe '#perform_later' do
    let!(:movie) { create :movie }

    it 'Job is queued without parameter' do
      expect do
        CreateMoviesJsonCacheJob.perform_later
      end.to have_enqueued_job
    end

    it 'Job is queued with parameter' do
      expect do
        CreateMoviesJsonCacheJob.perform_later movie
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      expect { CreateMoviesJsonCacheJob.perform_now }.not_to raise_error
    end
  end
end
