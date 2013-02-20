#!/usr/bin/perl

use YAML::AppConfig;
use Net::Jabber::Bot;

my $config = YAML::AppConfig->new(file => './xmpp_bot.yml');
my $con = $config->get('connection');
my $bot_info = $config->get('bot');

my $bot = Net::Jabber::Bot->new(
  server => $con->{server}, 
  conference_server => $con->{conference_server} . '.' . $con->{server}, 
  port => $con->{port},
  safety_mode => $con->{safety_mode},
  tls => $con->{tls},
  alias => $bot_info->{alias},
  username => $bot_info->{username},
  password => $bot_info->{password},
  message_function => \&new_bot_message,
  background_function => \&background_checks, 
  forums_and_responses => \%forum_list, 
);

$bot->JoinForum();
$bot->Start();

my %forum_list = ();

sub new_bot_message {
}

sub background_checks {
    my $bot= shift;
    my $counter = shift;
}
