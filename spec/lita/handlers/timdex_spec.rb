require 'spec_helper'

describe Lita::Handlers::TimdexHandler, lita_handler: true do
  it { is_expected.to route('lita ping').to(:ping) }

  it 'can ping timdex' do
    send_message('lita ping')
    expect(replies.last).to eq('pong')
  end

  it { is_expected.to route('lita echo popcorn').to(:echo) }

  it 'can echo stuff' do
    send_message('lita echo can you hear me now?')
    expect(replies.last).to eq('can you hear me now?')
  end
end
