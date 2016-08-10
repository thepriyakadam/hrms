module DailyBillDetailsHelper
	def all_travel_expence_type
	TravelExpenceType.all.collect { |x| [x.name, x.id] }
	end

	def all_currency
    CurrencyMaster.all.collect {|x| [x.name.to_s + ' - ' + x.description.to_s,x.id]}   
   end


    def all_reporting_masters_travel_request
    # TraineeRequest.a.collect { |s| [s.training_topic_master.try(:name), s.id] }.distinct
    # TraineeRequest.all.collect { |x| [x.training_topic_master.try(:name)] }.uniq
    @travel_request = TravelRequest.find(@daily_bill_detail.travel_request_id)
    ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id,status: nil).collect { |e| [e.reporting_master_id, e.id] }
    end

end
