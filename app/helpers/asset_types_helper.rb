module AssetTypesHelper
  def all_asset_type
  	AssetType.all.collect {|a| [a.name, a.id]}
  end
end
