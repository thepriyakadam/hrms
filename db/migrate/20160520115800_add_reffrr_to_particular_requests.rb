class AddReffrrToParticularRequests < ActiveRecord::Migration
  def change
     add_reference :particular_vacancy_requests, :vacancy_history, index: true, foreign_key: true
  end
end
