# class UrlParser 

#     attr_reader :scheme, :domain, :path, :fragment_id

#     def initialize(url)
#         @url = url
#         @scheme = @url.split('/')[0].split(':')[0]
#         @domain = @url.split('/')[2].split(':')[0] 

#         if @url.split('/')[2].include? ':' 
#             @port = @url.split('/')[2].split(':')[1]
#         else 
#             @port = nil 
#         end
#         @path = @url.split('/')[3].split('?')[0]
#         @querystring = {}
#     end

# #     def query_string
# #     request.query_string.split(/&/).inject({}) do |hash, setting|
# #   key, val = setting.split(/=/)
# #   hash[key.to_sym] = val
# #   hash
# # end
# # end
#     def query_string
#         qs = @url.split('/')[3].split('?')[1].split('#')[0].split('&')
#         qs.each do |item|
#             param = item.split('=')
#             @querystring[param[0]] = param[1]
#         end 
        
#         @querystring
#     end

#     def path 
#         if @path == "" 
#             @path = nil
#         end 
#         @path
#     end

#     def port 
#         if (@port == "" || @port == nil) && scheme == "https"
#             @port = 443.to_s
#         elsif (@port == "" || @port == nil) && scheme == "http"
#             @port = 80.to_s
#         end 
#         @port
#     end

#     def fragment_id
#         @fragment_id = @url.split('/')[3].split('?')[1].split('#')[1]
#     end
# end

# http://www.google.com:60/search?q=cat&name=Larry#img=FunnyCat
# class UrlParser

#   attr_reader :scheme, :domain, :path, :fragment_id, :port

  
#     def initialize(url)

#         @url = url
#         @fragment_id = url.split("#").last
#         @domain = @url.split('/')[2].split(':')[0]
#         @path = @url.split('/')[3].split('?')[0]
#         @querystring = {}
#         if @url.split('/')[2].include? ':' 
#             @port = @url.split('/')[2].split(':')[1]
#         else 
#             @port = nil 
#         end
#         @path = @url.split('/')[3].split('?')[0]
#         @querystring = {}
#     end
    
class UrlParser

  attr_reader :scheme, :domain, :path, :fragment_id, :port

    def initialize(url)
        @url = url
        @fragment_id = url.split("#").last
         @path = @url.split('/')[3].split('?')[0]
         @querystring = {}
        if @url.split('/')[2].include? ':' 
            @port = @url.split('/')[2].split(':')[1]
        else 
            @port = nil 
        end
    end
    
    def scheme 
        scheme_arr = @url.split(":")
        return scheme_arr[0]
    end
    
    def domain 
       domain_arr = @url.split("//").last.split(":").first
       return domain_arr
    end
        
    def path 
        if @path == "" 
            @path = nil
        end 
        @path
    end

    def port 
        if (@port == "" || @port == nil) && scheme == "https"
            @port = 443.to_s
        elsif (@port == "" || @port == nil) && scheme == "http"
            @port = 80.to_s
        end 
        @port
    end

    def query_string
        query_string = @url.split('/')[3].split('?')[1].split('#')[0].split('&')
        query_string.each do |item|
            param = item.split('=')
            @querystring[param[0]] = param[1]
        end 
        
        @querystring
    end
end
    #why does the last array item have to go first while the first array item has to go last?
   
#     def path 
#         path_arr = @url.split("/").last.split("?").first
#         return path_arr
#     end
    #why does it only work when I put '/' as last when it appears first in the url while '?' appears last?

#     def query_string 
#         query_string_arr = @url.split("?").last.split("#").first
#         query_string_arr = { "q" => "cat", "name" => "Larry"}
#     end

  # http://www.google.com:60/search?q=cat&name=Larry#img=FunnyCat

