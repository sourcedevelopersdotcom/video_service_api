require 'rails_helper'

RSpec.describe CreateEpisodesJsonCacheJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  describe '#perform_later' do
    let!(:season) { create :season }
    let!(:episode) { create :episode, season: season }

    it 'Job is queued without parameter' do
      expect do
        CreateEpisodesJsonCacheJob.perform_later
      end.to have_enqueued_job
    end

    it 'Job is queued with parameter' do
      expect do
        CreateEpisodesJsonCacheJob.perform_later episode
      end.to have_enqueued_job
    end

    it 'Cache was creted properly' do
      expect { CreateEpisodesJsonCacheJob.perform_now }.not_to raise_error
    end
  end
end
