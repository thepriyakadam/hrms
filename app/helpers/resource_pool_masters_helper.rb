module ResourcePoolMastersHelper

  def all_resource_pool
    ResourcePoolMaster.where(status: true).collect { |x| [x.name, x.id] }
  end
end
