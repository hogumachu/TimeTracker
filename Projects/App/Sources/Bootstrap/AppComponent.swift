//
//  AppComponent.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import NeedleFoundation

import Calendar
import CalendarInterface
import CalendarService
import CalendarServiceInterface
import Home
import HomeInterface
import Splash
import SplashInterface
import Todo
import TodoInterface
import UserService
import UserServiceInterface

final class AppComponent: BootstrapComponent {
  var rootBuilder: RootBuildable {
    RootBuilder {
      RootComponent(parent: self)
    }
  }
}

// MARK: - Service

extension AppComponent {
  var userService: UserServicable {
    shared { UserService() }
  }
  
  var calendarService: CalendarServicable {
    shared { CalendarService(focusedDate: .now) }
  }
}

// MARK: - Calendar

extension AppComponent {
  var calendarBuilder: CalendarBuildable {
    CalendarBuilder {
      CalendarComponent(parent: self)
    }
  }
}

// MARK: - HomeDashboard

extension AppComponent {
  var homeDashboardBuilder: HomeDashboardBuildable {
    HomeDashboardBuilder {
      HomeDashboardComponent(parent: self)
    }
  }
}

// MARK: - TodoDashboard

extension AppComponent {
  var todoDashboardBuilder: TodoDashboardBuildable {
    TodoDashboardBuilder {
      TodoDashboardComponent(parent: self)
    }
  }
}

// MARK: - Splash

extension AppComponent {
  var splashBuilder: SplashBuildable {
    SplashBuilder {
      SplashComponent(parent: self)
    }
  }
}
