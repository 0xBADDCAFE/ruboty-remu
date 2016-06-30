require "ruboty/remu/version"

module Ruboty
  module Handlers
    class Remu < Base
      NAMESPACE = "remu"
      on(
        /remu add (?<name>\S+) (?<regexp>\S+) (?<action>.+)/,
        name: 'add',
        description: 'register action',
      )

      on(
        /remu list/,
        name: 'list',
        description: 'list regexp actions',
      )

      on(
        /remu detail (?<name>\S+)/,
        name: 'detail',
        description: 'detail regexp action',
      )

      on(
        /remu remove (?<name>\S+)/,
        name: 'remove',
        description: 'remove regexp action',
      )

      on(
        /(?!#{ENV['RUBOTY_NAME']} remu )(?<post>.+)?/,
        name: 'act',
        description: 'nin\'i',
        all: true,
        hidden: true
      )

      def add(message)
        regexps[message[:name]] = message[:regexp]
        actions[message[:name]] = message[:action]

        message.reply("name: #{message[:name]}, regexp: #{message[:regexp]}, action: #{message[:action]}")
      end

      def list(message)
        message.reply(actions.keys.join ', ')
      end

      def detail(message)
        if regexps.has_key?(message[:name])
          message.reply("name: #{message[:name]}, regexp: #{regexps[message[:name]]}, action: #{actions[message[:name]]}")
        else
          message.reply('no action.')
        end
      end

      def remove(message)
        if regexps.has_key?(message[:name])
          regexps.delete message[:name]
          actions.delete message[:name]
          message.reply("action name '#{message[:name]}' has deleted.")
        else
          message.reply('no action.')
        end
      end

      def act(message)
        key = nil

        hits = regexps.map { |k, v|
          m = Regexp.compile(v).match  message[:post]
          [k, m] if m
        }.compact
        .tap { |xs| key = xs.sample[0] unless xs.empty?}
        .to_h

        message.reply(hits[key][0].gsub(Regexp.compile(regexps[key]), actions[key])) if key
      end

      private
      def data
        robot.brain.data[NAMESPACE] ||= {}
      end

      def regexps
        data[:regexp] ||= {}
      end

      def actions
        data[:action] ||= {}
      end
    end
  end
end
