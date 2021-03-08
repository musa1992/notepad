class UpdateClientStatusWorker
    require 'sidekiq-scheduler'
    include Sidekiq::Worker

    def perform
        clients = Client.where ('end_date < ?', Date.current)
        clients.each do |client|
            client.update_columns(end_date: 'Inactive')
        end
    end
    UpdateClientStatusWorker.perform_async
end