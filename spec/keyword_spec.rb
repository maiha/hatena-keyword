require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Hatena::Keyword do
  subject { Hatena::Keyword }

  it { should respond_to(:[]) }
  it { should respond_to(:search) }
  it { should respond_to(:link) }
end
