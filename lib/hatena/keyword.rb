
module Hatena
  Keyword = Struct.new(:word, :score, :cname, :refcount)

  class Keyword
    def to_s
      word
    end

    class << self
      def search(body)
        Hatena::Keyword::Retrieve.new(body).execute
      end

      def link(body)
        Hatena::Keyword::Link.new(body).execute
      end

      def [](body)
        search(body).map(&:to_s).uniq
      end
    end

    ######################################################################
    ### Service

    class Service
      attr_accessor :result

      dsl_accessor :logger, Null.new, :instance => true
      dsl_accessor :default_options, proc{{}}

      def initialize(string, options = {})
        @string  = NKF.nkf('-w', string.to_s)
        @options = options
        @result  = nil
      end

      def execute
        server = XMLRPC::Client.new2('http://d.hatena.ne.jp/xmlrpc')
        method = 'hatena.setKeywordLink'

        hash = default_options
        hash.delete(:body)
        logger.debug "#{self.class.name}(%s, %s)" % [method, hash.inspect]
        @result = server.call(method, default_options)
      end

      private
        def default_options
          self.class.default_options.merge(@options).merge(:body => @string)
        end

        def option(key)
          default_options[key]
        end
    end

    class Link < Service
      default_options({:cname=>"idol", :a_class=>"hatena-keyword", :score=>20})

      def replace(&block)
        result.gsub(%r{<a class="#{option(:a_class)}".*?>(.*?)</a>}i) {block.call($1)}
      end
    end

    class Retrieve < Service
      default_options({:cname=>"idol", :a_class=>"hatena-keyword", :score=>20, :mode=>'lite'})

      def execute
        super
        return keywords
      end

      def keywords
        # result: {"wordlist"=>[{"score"=>78, "cname"=>"idol", "word"=>"石村舞波", "refcount"=>4}]}
        @result["wordlist"].map do |h|
          Hatena::Keyword.new(h["word"], h["score"], h["cname"], h["refcount"])
        end
      end
    end
  end
end

