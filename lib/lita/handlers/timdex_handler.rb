module Lita
  module Handlers
    class TimdexHandler < Handler
      # insert handler code here

      route(/^ping/, :ping, help: { "ping" => "Checks TIMDEX!" })

      route(/^echo\s+(.+)/, :echo)

      def ping(response)
        # Timdex no longer requires auth and will continue on just fine with
        # bad auth. The gem for now doesn't understand that so you need to
        # provide _something_ even if it's obviously junk like this.
        # Once the gem is updated, we can fix this until we need real auth
        # later.
        pong = Timdex.new('FAKE_FOR_NOW', 'IT_WILL_WORK_ANYWAY').ping

        response.reply(render_template('ping', data: pong))
      end

      def echo(response)
        response.reply(response.matches)
      end

      Lita.register_handler(self)
    end
  end
end
