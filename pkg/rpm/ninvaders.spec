Name: ninvaders
Version:    %{_version}
Release:    %{_release}%{?dist}
BuildArch:  x86_64
Requires:   ncurses
URL:        https://github.com/doctorfree/ninvaders
Vendor:     Doctorwhen's Bodacious Laboratory
Packager:   ronaldrecord@gmail.com
License     : GPL2
Summary     : NCurses text based Invaders video game

%global __os_install_post %{nil}

%description

%prep

%build

%install
cp -a %{_sourcedir}/usr %{buildroot}/usr

%pre

%post

%preun

%files
%defattr(-,root,root)
%attr(4755, games, games) /usr/games/bin/*
%attr(0644, games, games) /usr/games/lib/ninvaders/*
%exclude %dir /usr/games
%exclude %dir /usr/games/bin
%exclude %dir /usr/games/lib
/usr/games/ninvaders

%changelog
