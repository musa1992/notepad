class Metric < ApplicationRecord
  belongs_to :relationship_officer

  def self.create_metric(metrics)
    days = 7.day
    if Metric.find_by(date: metrics[:due_date]).nil?
        control = metrics[:loan_duration].to_i
        control.times do
          Metric.create(date: metrics[:due_date],amount_due: metrics[:instalment_amount], amount_collected: 0, accounts_due: 1, relationship_officer_id: metrics[:relationship_officer_id] )
          due = metrics[:due_date].to_datetime 
          due += days
          metrics[:due_date] = due
        end
      return
    end
    dates = self.generate_due_dates(metrics[:due_date].to_datetime,metrics[:loan_duration].to_i)
    
    metric = Metric.find_by_date_and_relationship_officer_id(metrics[:due_date], metrics[:relationship_officer_id])

    unless metric.nil?
      dates.each do |date|
        metric = Metric.find_by(date: date)
        if metric.nil?
          Metric.create(date: date,amount_due: metrics[:instalment_amount], amount_collected: 0, accounts_due: 1, relationship_officer_id: metrics[:relationship_officer_id] )
        else
          amount = metric.amount_due + metrics[:instalment_amount].to_f
          accounts = metric.accounts_due + 1
          metric.update(amount_due: amount, accounts_due: accounts)
        end 
      end 
      return
    end

    if metric.relationship_officer_id != metrics[:relationship_officer_id].to_i
      dates.each do |date|
        Metric.create(date: date,amount_due: metrics[:instalment_amount], amount_collected: 0, accounts_due: 1, relationship_officer_id: metrics[:relationship_officer_id] )
      end
    end
  end

  def self.update_amount_collected(relationship_officer_id, amount, date)
    metric = Metric.find_by_date_and_relationship_officer_id(date, relationship_officer_id)
    amount += metric.amount_collected
    metric.update(amount_collected: amount)

  end

  private
    
    def self.generate_due_dates(due_date,loan_duration)
      dates = []
      days = 7.days

      loan_duration.times do
        dates << due_date
        due_date += days
      end
      dates
    end

    
end
