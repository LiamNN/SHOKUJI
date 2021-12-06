class ColesScraper
  require 'nokogiri'
  require 'open-uri'

  def initialize
  end

  def scrape_coles(ing)
    html_content = URI.open("https://shop.coles.com.au/a/richmond-south/everything/search/#{ing}").read
    doc = Nokogiri::HTML(html_content)

    # if doc.css(".icon-every-day-badge .product-title") == []
    #   product = doc.css(".icon-every-day-badge .product-title").first
    # else
    byebug
      product = doc.search(".product-title").first
    # end
    href = product.css("a").first["href"]
    deet_grabber(href, ing)
  end

  def deet_grabber(href, ing)
    html_content = URI.open("https://shop.coles.com.au#{href}").read
    doc = Nokogiri::HTML(html_content)

    hash = {}
    price = doc.css(".package-price").first
    hash[ing] = price
  end

  def woolies(ing)
    require "uri"
    require "json"
    require "net/http"

    url = URI("https://www.woolworths.com.au/apis/ui/Search/products")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Cookie"] = "_abck=ED90142D328F552FB25F98613D7AD32C~-1~YAAQVQUgF86be4x9AQAACemIjgd5ZAed3wb9BQHOBBqYVY1mtS5Xrkd1zGF3mLApl12f7I0nEXBmyUgX6/VH0I/+spnLpkCJ5QH4WwG1cBx8w5VvLHrFzoC5sdcMab6tKjznTnnZKeFDgT/EpHNEfY1QFfmw1Opeh6lPI7S5ATHSveKTbH5REpyf/CxIN0ca+hBzph75xpmHMwKPqWhoLT3P5Y67CRE/GJQkagADx7A/q6KTQVehxqVFZQ8xFjaxslbr+MH47mWS18j6HKkHAaAq9yQSbxW4xrN5iLWjHGVP2dVtZllxemfT7j/j9AMWO1IYhze7YJ27BXIQCdtMj+HOy7i+lJhhbn+KJRClnIoqQMQqUxFu/TJzEWu66EB+SXSOCyLqqKD0EZP1PC4=~-1~-1~-1; ak_bmsc=B091DBC7EC17C5838B18336674A3E3E4~000000000000000000000000000000~YAAQLAUgF5DYQo19AQAA8bB5jg54s1FqaP2yV0GYlbhSbPRMIk/PgODB4ngoXPip4s+e65LUTphw0Eb3kRSTMEi355W06TpGXy60s5tAJrZXWCOJ4GJUgWamwKa5xAhqPqA9VoG6mqo7/fUhZKl4lEx08SxC3NueJOhWMhxb43IfKDRwmIDcLZhJ5bepmIlHyd6LuVazduGTJMQNz2sJnoewgq43H6cwR4HA+rJQM6ZY4VdwCXU9Lc60pAgqdvvLIzPqu7yyxniqIgoX+AnCnh+DqSHIiN2usXnLRcDn66kI+49z5uA6q9WIszAlednqGsEmNjwEE6LmQqZ8VOjGXRl0ttcURQk6MNry4scPeFHZZDGQ/IJFHaU+9p5WEJJoegGeTO3J5sfc+6pZLFtu2MwutA6j2c9rDlDVg5Ir8/7aaxAEN0KKubgbgQ==; bm_mi=E70D0B6205354E7799F102F055DBF789~EHnIftAcDOMV9luvr4qyjl/4Oa6dxfyEq8hk79Ri7b/aVUV7lTK2Sp8k0gNz6qoxvfvkmOObMKh5pvpXI3wOtX57eYt5q5wmYVCsMHV6U9/u0MnqaB2NpIbUfxD8FdpFfYxJPPrsZZMAXZ0AVlJUW9KPbMO3TD7574v8puhe1VBF7shUBOUPR/mN+IxLzq9hoWKuSYs9fEetZFkKs5m6yN1qu9mPMU/pt7hS3UpVijU4jjCv0ivEXJLP5WiDPq9+N6d2ruZoyfidyzEVqd0xAA==; bm_sv=8735AB6B372837F4D74AB2A81B817FB6~CQTIzQ3nxRzJA1QjwxXmFpYC5lgfUQ5uSUUX8pZO/C1rJU9jpmPjQsN/JA80sqa7zn9Kjh3E6gMY4S5s6KA/943UtZSbTsjeTXYFJqwC4mCgWtkwgblvYEaCJOQqczn75MyEENygRRjaOQG09OCOX8D79kjRjuTszz2BTwfNfLE=; bm_sz=E41936168BF336A853231CCBB9B8F186~YAAQVQUgFyEfeYx9AQAAD892jg6yaSXwK6QwMDu0FX4+FTsqJbZvk/M4iU8odWEQOxmLNcdKz1x+Mi+YcDoYOBkg0UTnWm7GmSrl53P6ZIqZb5/6vrKnyjJh4u3kkNsoAcYnsmK2ykU+lkqDVkD5GF5dL9LKsW0fdAhLckOdu+fUerC8rMYM4+D6/Cge2WekIHEn0Q+HRZ0FPYUB0YQpZTSZmsgQQl0LBsjyVOxYqQkIEtg3cX8w5DSpG/OPicbCUZ4RcZJXVfjxil09OGOkYKaH2mjjnU0/MdcG+xo4mwfOOASCzIclzMMk~4342082~3687736; prodwow-auth-token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2Mzg3NzI4NzksImV4cCI6MTYzODc3NjQ3OSwiaWF0IjoxNjM4NzcyODc5LCJpc3MiOiJXb29sd29ydGhzIiwiYXVkIjoid3d3Lndvb2x3b3J0aHMuY29tLmF1Iiwic2lkIjoiMCIsInVpZCI6Ijc0MWZjNTMxLWNmZTAtNDRmZS05ZjY4LWJhOGZkMmRmOGUxZiIsIm1haWQiOiIwIiwiYXV0IjoiU2hvcHBlciIsImF1YiI6IjAiLCJhdWJhIjoiMCIsIm1mYSI6IjEifQ.IWrRtCveDazGxrm7pc-Y8zRa-nZH-KfAMZm3PWtaTT7NpNHMtY8_WCCz6dFDjIi0MnLq-RUbP6V-oQWPt5r9Ic6sZwEZywnNO9oYvZThAEQt1k2wUgj0de5EKanUADXC9mXh_GfLAceC4DmtLV7UsCVXqxuK9SV6de5wL5_VHP-iElWTmydMMUyAsyOguAuPy3jS1Fhzm6Wc3HVp0pOqA5F15GhqFNz3jsNWlrOfAJIc2zgucu6VD16B6oy5O2bCbbZ5BXA3o0GuUxdKBsUAR19YOo08jrpriYSgRjY-hERDTT9sffHdLaHuTesg58MrsmvR-SOgo0GoMe_8Pb0oeg; wow-auth-token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2Mzg3NzI4NzksImV4cCI6MTYzODc3NjQ3OSwiaWF0IjoxNjM4NzcyODc5LCJpc3MiOiJXb29sd29ydGhzIiwiYXVkIjoid3d3Lndvb2x3b3J0aHMuY29tLmF1Iiwic2lkIjoiMCIsInVpZCI6Ijc0MWZjNTMxLWNmZTAtNDRmZS05ZjY4LWJhOGZkMmRmOGUxZiIsIm1haWQiOiIwIiwiYXV0IjoiU2hvcHBlciIsImF1YiI6IjAiLCJhdWJhIjoiMCIsIm1mYSI6IjEifQ.IWrRtCveDazGxrm7pc-Y8zRa-nZH-KfAMZm3PWtaTT7NpNHMtY8_WCCz6dFDjIi0MnLq-RUbP6V-oQWPt5r9Ic6sZwEZywnNO9oYvZThAEQt1k2wUgj0de5EKanUADXC9mXh_GfLAceC4DmtLV7UsCVXqxuK9SV6de5wL5_VHP-iElWTmydMMUyAsyOguAuPy3jS1Fhzm6Wc3HVp0pOqA5F15GhqFNz3jsNWlrOfAJIc2zgucu6VD16B6oy5O2bCbbZ5BXA3o0GuUxdKBsUAR19YOo08jrpriYSgRjY-hERDTT9sffHdLaHuTesg58MrsmvR-SOgo0GoMe_8Pb0oeg; INGRESSCOOKIE=1638772880.402.65.629749; akaalb_woolworths.com.au=~op=www_woolworths_com_au_ZoneA:PROD-ZoneA|www_woolworths_com_au_BFF_SYD_Launch:WOW-BFF-SYD2|~rv=20~m=PROD-ZoneA:0|WOW-BFF-SYD2:0|~os=43eb3391333cc20efbd7f812851447e6~id=44ac4f95e373d44f729e67a12a5ccb52; bff_region=syd2; w-rctx=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2Mzg3NzI4NzksImV4cCI6MTYzODc3NjQ3OSwiaWF0IjoxNjM4NzcyODc5LCJpc3MiOiJXb29sd29ydGhzIiwiYXVkIjoid3d3Lndvb2x3b3J0aHMuY29tLmF1Iiwic2lkIjoiMCIsInVpZCI6Ijc0MWZjNTMxLWNmZTAtNDRmZS05ZjY4LWJhOGZkMmRmOGUxZiIsIm1haWQiOiIwIiwiYXV0IjoiU2hvcHBlciIsImF1YiI6IjAiLCJhdWJhIjoiMCIsIm1mYSI6IjEifQ.IWrRtCveDazGxrm7pc-Y8zRa-nZH-KfAMZm3PWtaTT7NpNHMtY8_WCCz6dFDjIi0MnLq-RUbP6V-oQWPt5r9Ic6sZwEZywnNO9oYvZThAEQt1k2wUgj0de5EKanUADXC9mXh_GfLAceC4DmtLV7UsCVXqxuK9SV6de5wL5_VHP-iElWTmydMMUyAsyOguAuPy3jS1Fhzm6Wc3HVp0pOqA5F15GhqFNz3jsNWlrOfAJIc2zgucu6VD16B6oy5O2bCbbZ5BXA3o0GuUxdKBsUAR19YOo08jrpriYSgRjY-hERDTT9sffHdLaHuTesg58MrsmvR-SOgo0GoMe_8Pb0oeg"
    request.body = JSON.dump({
      "Filters": [],
      "IsSpecial": false,
      "Location": "/shop/search/products?searchTerm=#{ing}",
      "PageNumber": 1,
      "PageSize": 24,
      "SearchTerm": ing,
      "SortType": "TraderRelevance"
    })

    response = https.request(request)
    puts response.read_body
  end

end
