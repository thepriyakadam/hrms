module ResourcePoolMastersHelper

  def all_resource_pool
    ResourcePoolMaster.all.collect { |x| [x.name, x.id] }
  end
end
