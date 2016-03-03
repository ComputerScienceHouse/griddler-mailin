module Griddler
  module Mailin
    class Adapter
      def initialize(params)
        if params['mailinMsg'].is_a? String
          @params = JSON.parse(params['mailinMsg'])
        else
          @params = params['mailinMsg']
        end
      end

      def self.normalize_params(params)
        adapter = new(params)
        adapter.normalize_params
      end

      def normalize_params
        params = {
          to: params['envelopeTo']['address'],
          cc: parse_recipients(params['cc'],
          from: params['envelopeFrom']['address'].first,
          subject: params['subject'],
          text: params['text'],
          html: params['html'],
        }
        params[:to] =
      end

      private

      attr_reader :params

      def parse_recipients(mailin_to)
        mailin_to.map do | obj |
          "#{obj['name']} <#{obj['address']}>"
        end
      end
    end
  end
end
