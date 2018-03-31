module ResourcePoolMastersHelper

  def all_resource_pool
    ResourcePoolMaster.where(status: true).collect { |x| [x.code, x.id] }
  end
end
