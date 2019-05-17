require 'spec_helper'

describe Lita::Handlers::TimdexHandler, lita_handler: true do
  it { is_expected.to route('lita ping').to(:ping) }

  it 'can ping timdex' do
    send_message('lita ping')
    expect(replies.last).to eq('pong')
  end

  it { is_expected.to route('lita search popcorn').to(:search) }

  it 'can search stuff' do
    send_message('lita search popcorn')
    expect(replies.last).to include('Searching for "popcorn"')
    expect(replies.last).to include('response(s) indicated')
    expect(replies.last).to include('ID:')
  end
end
