import { Meteor } from 'meteor/meteor';
import { FlowRouter } from 'meteor/kadira:flow-router';
import { BlazeLayout } from 'meteor/kadira:blaze-layout';
import { AccountsTemplate } from 'meteor/useraccounts:bootstrap';

import '../../ui/layouts/layout.js';
import '../../ui/components/navbar/navbar.js';
import '../../ui/components/footer/footer.js';
import '../../ui/pages/index/index.js';
import '../../ui/pages/login/login.js';
import '../../ui/pages/register/register.js';

FlowRouter.route('/', {
  name: 'main',
  action: () => {
    BlazeLayout.render('layout', {top: 'navbar', yield: 'index'});
  }
});

FlowRouter.route('/login', {
  name: 'login',
  action: () => {
    if(!Meteor.user()){
      BlazeLayout.render('layout', {top: 'navbar', yield: 'login'});
    }else{
      FlowRouter.go('/');
    }
  }
});

FlowRouter.route('/register', {
  name: 'register',
  action: () => {
    if(!Meteor.user()){
      BlazeLayout.render('layout', {top: 'navbar', yield: 'register'});
    }else{
      FlowRouter.go('/');
    }
  }
});
