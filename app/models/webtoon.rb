class Webtoon < ActiveRecord::Base
	validates:url,presence:true #url 존재여부 검사 
end
