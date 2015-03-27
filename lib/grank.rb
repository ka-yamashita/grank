require "grank/version"
# coding: utf-8
require 'open-uri'

module Grank
  def get_page_rank(domain_name, google='toolbarqueries.google.com')
    seed = "Mining PageRank is AGAINST GOOGLE'S TERMS OF SERVICE. Yes, I'm talking to you, scammer."
    tmp = 0x01020345

    ## $BF|K\8l%I%a%$%s$bBP1~$7$F$$$^$9(B
    domain_name = SimpleIDN.to_ascii(domain_name)

    domain_name.length.times do |i|
        tmp ^= seed[i%seed.length].ord ^ domain_name[i].ord
        tmp = ((tmp >> 23) & 0x1ff) | tmp << 9
    end

    tmp = -(~(tmp & 0xFFFFFFFF) + 1)
    ch  = sprintf('8%x', tmp);

    url = 'http://%s/tbr?client=navclient-auto&ch=%s&features=Rank&q=info:%s'
    url = sprintf(url, google , ch, domain_name)
    $1 if open(url).read.strip =~ /([0-9]+)$/
    rescue
      Rails.logger.error("$B%Z!<%8%i%s%/$N<hF@$K<:GT$7$^$7$?(B $B%I%a%$%sL>(B:#{domain_name}")
  end
end
