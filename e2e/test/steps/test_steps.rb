steps_for :tests do
  step ':pathにアクセス' do |path|
    visit path
  end
  step ':contentが含まれる' do |content|
      expect(page).to have_content content
  end
end
