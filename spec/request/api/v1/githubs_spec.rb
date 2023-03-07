require 'rails_helper'




path1 = File.join(File.dirname(__FILE__), 'githubs_stub.json')

first_stub_result = File.open(path1).read

RSpec.describe 'Api::V1::GithubsController', type: :request do
describe 'GET /repos' do

subject do

   user=User.create(Name:'schacon')
  get('/api/v1/schacon/repos', params: { name: 'schacon' })
end

let(:response_json) do

[

    {

        "name": "3D-Me",

        "stargazers_count": 0

    },

    {

        "name": "aeon",

        "stargazers_count": 3

    }

    ]

end




before do

    WebMock.stub_request(:get, "https://api.github.com/users/schacon/repos").

    with(

        headers: {

        'Accept': '*/*',

        'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

        'User-Agent': 'Ruby'

        }

    ).

    to_return(status: 200, body: first_stub_result, headers: {})

    subject

end




it "shoud save and render correct results" do

  json = JSON.parse(response.body)

  expect(response).to have_http_status(:ok)

  expect(json.first["Name"]).to eq("3D-Me")

end

end

end


