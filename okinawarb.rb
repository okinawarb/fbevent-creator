require "fb_graph"

user = FbGraph::Auth.new(CLIENT_ID, CLIENT_SECRET)
auth.from_signed_request(params[:signed_request])
if auth.authorized?
  auth.user.fetch
else
  p auth.data
end
