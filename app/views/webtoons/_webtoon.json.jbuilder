json.extract! webtoon, :id, :url, :pre_day, :created_at, :updated_at
json.url webtoon_url(webtoon, format: :json)