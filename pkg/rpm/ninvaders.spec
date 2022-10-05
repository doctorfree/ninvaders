Name: ninvaders
Version:    %{_version}
Release:    %{_release}%{?dist}
BuildArch:  x86_64
Requires:   curl, ImageMagick, libjpeg-turbo, libpng
URL:        https://github.com/doctorfree/ninvaders
Vendor:     Doctorwhen's Bodacious Laboratory
Packager:   ronaldrecord@gmail.com
License     : GPL2
Summary     : Convert any format image file to an Ascii Art text file

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
/usr
%exclude %dir /usr/share/doc
%exclude %dir /usr/share
%exclude %dir /usr/bin

%changelog
