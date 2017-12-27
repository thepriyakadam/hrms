module ServiceMastersHelper

  def all_service_master
    ServiceMaster.all.collect { |x| [x.name, x.id] }
  end
end
