require 'spec_helper'

describe Clipboard do
  let :mkdir do
    double(:name => 'mkdir')
  end

  let :ls do
    double(:name => 'ls')
  end

  before do
    subject.commands << mkdir
  end

  it 'should respond to undo' do
    subject.should respond_to :undo
  end

  it 'should add last_undo command' do
    subject.undo
    subject.commands.should be_empty
  end

  it 'should readdd last undo command on redo' do
    subject.undo.redo
    subject.commands.should == [mkdir]
  end

  it 'should return self when call undo' do
    subject.undo.should eq subject
  end

  it 'should return self when call redo' do
    subject.redo.should eq subject
  end

  it 'should undo twice and redo' do
    subject.commands << ls
    subject.undo.undo.redo.redo
    subject.commands.should == [mkdir,ls]
    subject.last_commands.should be_empty
  end
end
