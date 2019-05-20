require 'spec_helper'

describe Lita::Handlers::TimdexHandler, lita_handler: true do
  it { is_expected.to route('lita ping').to(:ping) }

  it { is_expected.not_to route('ping').to(:ping) }

  it 'can ping timdex' do
    send_message('lita ping')
    expect(replies.last).to eq('pong')
  end

  it { is_expected.to route('lita search popcorn').to(:search) }

  it 'can search stuff' do
    send_message('lita search popcorn')
    expect(replies.last).to include('total result(s) for "popcorn"')
    expect(replies.last).to include('https://library.mit.edu/item/')
  end

  it { is_expected.not_to route('search popcorn').to(:search) }
end
