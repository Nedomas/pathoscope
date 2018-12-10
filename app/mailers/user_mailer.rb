class UserMailer < ActionMailer::Base
  default from: "hello@pathoscope.com"

  BETA_EMAILS = []
  BETA_USERNAMES = [
    'Sylvester Cat',
    'Quackmore Duck',
    'Baloo',
    'Bagheera',
    'Pink panther',
    'Bugs bunny',
    'Felix the cat',
    'Samurai Jack',
    'Mojo Jojo',
    'Betty Boop',
    'Darkwing Duck',
    'Mayor Quimby',
    'Moe Szyslak',
    'Wile E. Coyote',
    'Top Cat',
    'Scooby Doo',
    'Buzz Lightyear',
    'Popeye',
    'Woody Woodpecker',
    'Garfield',
    'Droopy',
    'Donald Duck',
    'Captain Hook',
    'Mighty Mouse',
    'Casper',
    'Action Man',
    'Scrooge mcduck',
    'Batman',
    'Superman',
    'Sonic the Hedgehog',
    'Johny Bravo',
    'Huckleberry Hound',
    'Mickey Mouse',
    'The Flame',
    'Minnie Mouse',
    'Goofy',
    'Horace Horsecollar',
    'Plantom Blot',
    'Max Goof',
    'Oswald the Lucky Rabbit',
    'Detective Casey',
    'Sylvester Shyster',
    'Gideon Goat',
    'Spike the Bee',
    'Willie the Giant',
    'Louie the Mountain Lion',
    'Salty the Seal',
    'Robin Hood',
    'Hercules',
    'Snow White',
    'Cinderella',
    'Bambi',
    'The Lion King',
    'Pinocchio',
    'King Arthur',
    'Frankenstein',
    'Sherlock Holmes',
    'Aladdin',
    'Ali Baba',
    'Cheshire cat',
    'James Bond',
    'Gulliver',
    'Huckleberry Finn',
    'Little Red Riding Hood',
    'Captain Horatio',
    'Chicken Little',
    'Sinbad',
  ]

  BETA_TESTERS = {}

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitation.subject
  #
  def add_to_model
    BETA_TESTERS.each do |email, username|
      password = username.delete(' ').downcase + rand(10..99).to_s
      BetaTester.create(email: email, username: username, password: password)
    end
  end

  def send_mailgun
    RestClient.post ""\
    "",
    :from => "",
    :to => "",
    :subject => "",
    :text => ""
  end

  def create_send_invite(email, username)
    password = username.delete(' ').downcase + rand(10..99).to_s
    tester = BetaTester.create!(email: email, username: username, password: password)
    @email = tester.email
    @password = tester.password
    user = User.create!(email: @email, username: tester.username, password: @password)

    m = mail(to: @email, subject: 'Beta invite to Pathoscope', template_name: 'invitation').deliver
    tester.sent = true
    tester.save
    puts "Sent to #{m.to[0]}"
    puts "Body: "
    puts m.body
    puts "----------"
    puts @email
    puts @password
  end

  def send_single
    tester = BetaTester.where(sent: nil).first
    @email = tester.email
    @password = tester.password
    #user = User.create!(email: @email, username: tester.username, password: @password)

    m = mail(to: '', subject: 'Beta invite to Pathoscope', template_name: 'invitation').deliver
    # m = mail(to: @email, subject: 'Beta invite to Pathoscope', template_name: 'invitation').deliver
    tester.sent = true
    tester.save
    puts "Sent to #{m.to[0]}"
    puts "Body: "
    puts m.body
    puts "----------"
    puts @email
    puts @password
  end

  def mail_all
    BetaTester.all.each do |tester|
      User.create!(email: tester.email, username: tester.username, password: tester.password)
      # Do the sending
      if success
        tester.sent = true
        tester.save!
      end
    end
  end

  def invitation
    mail to: @email
  end
end
