module Lita
  module Handlers
    class Timdex < Handler
      # insert handler code here

      route(/^ping/, :ping, help: { "ping" => "Checks TIMDEX!" })

      def ping(response)
        response.reply(render_template('ping'))
      end

      Lita.register_handler(self)
    end
  end
end
