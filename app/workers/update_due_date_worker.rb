class UpdateDueDateWorker
  require 'sidekiq-scheduler'
  include Sidekiq::Worker
  sidekiq_options retry: false

  # def perform
  #   clients = Client.where('due_date < ?', Date.current)
  #   clients.each do |client|
  #     date = client.due_date + (7.days)
  #     client.update_columns(due_date: date)
  #   end
  # end

  # UpdateDueDateWorker.perform_async
end
