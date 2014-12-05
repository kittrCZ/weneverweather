class IpResult
  attr_accessor :as, :city, :country, :country_code, :isp, :lat, :lon, :query, :reqion, :region_name, :timezone, :zip

  def initialize(args)
    @as =               args['as']
    @city =             args['city']
    @country =          args['country']
    @country_code =     args['country_code']
    @isp =              args['isp']
    @lat =              args['lat']
    @lon =              args['lon']
    @query =            args['query']
    @region =           args['region']
    @region_name =      args['region_name']
    @timezone =         args['timezone']
    @zip =              args['zip']
  end
end

