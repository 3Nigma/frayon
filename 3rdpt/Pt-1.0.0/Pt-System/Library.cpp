/*
 * Copyright (C) 2006-2008 Marc Boris Duerner
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * As a special exception, you may use this file as part of a free
 * software library without restriction. Specifically, if other files
 * instantiate templates or use macros or inline functions from this
 * file, or you compile this file and link it with other files to
 * produce an executable, this file does not by itself cause the
 * resulting executable to be covered by the GNU General Public
 * License. This exception does not however invalidate any other
 * reasons why the executable file might be covered by the GNU Library
 * General Public License.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include "LibraryImpl.h"
#include <Pt/System/Library.h>
#include <Pt/System/FileInfo.h>
#include <Pt/System/IOError.h>
#include <memory>

namespace Pt {

namespace System {

SymbolNotFound::SymbolNotFound(const std::string& sym)
: SystemError("symbol not found")
, _symbol(sym)
{ }


SymbolNotFound::SymbolNotFound(const char* sym)
: SystemError("symbol not found")
, _symbol(sym)
{ }


Library::Library()
: _impl(0)
{
    _impl = new LibraryImpl();
}


Library::Library(const std::string& path)
: _impl(0)
{
    std::auto_ptr<LibraryImpl> impl( new LibraryImpl() );
    _impl = impl.get();
    open(path);
    impl.release();
}


Library::Library(const char* path)
: _impl(0)
{
    std::auto_ptr<LibraryImpl> impl( new LibraryImpl() );
    _impl = impl.get();
    open(path);
    impl.release();
}


Library::Library(const Library& other)
{
    _path = other._path;
    _impl = other._impl;
    _impl->ref();
}


Library& Library::operator=(const Library& other)
{
    if(_impl == other._impl)
        return *this;

    _path = other._path;

    other._impl->ref();

    if( ! _impl->unref() )
        delete _impl;

    _impl = other._impl;

    return *this;
}


Library::~Library()
{
    if ( ! _impl->unref() )
        delete _impl;
}


void Library::detach()
{
    if ( _impl->refs() == 1 )
        return;

    _path.clear();

    LibraryImpl* x = _impl;
    _impl = new LibraryImpl();

    if( ! x->unref() )
        delete x;
}


Library& Library::open(const std::string& libname)
{
    return open( libname.c_str() );
}


Library& Library::open(const char* libname)
{
    this->detach();
    
    std::string path = libname;

    try
    {
        //log_debug("search for library \"" << path << '"');
        _impl->open(path);
        _path = path;
        return *this;
    }
    catch(const AccessFailed&)
    { }

    path += suffix();
    try
    {
        //log_debug("search for library \"" << path << '"');
        _impl->open(path);
        _path = path;
        return *this;
    }
    catch(const AccessFailed&)
    { }

    std::string::size_type idx = path.rfind( FileInfo::sep() );
    if(idx == std::string::npos)
    {
        idx = 0;
    }
    else if( ++idx == path.length() )
    {
        throw AccessFailed(path);
    }

    path.insert( idx, prefix() );
    //log_debug("search for library \"" << path << '"');
    _impl->open(path);
    _path = path;

    return *this;
}


void Library::close()
{
    this->detach();

    _impl->close();
}


void* Library::resolve(const char* symbol) const
{
  return _impl->resolve(symbol);
}


Symbol Library::getSymbol(const char* symbol) const
{
    void* sym = this->resolve(symbol);
    if (sym == 0)
    {
        throw SymbolNotFound(symbol);
    }

    return Symbol(*this, sym);
}


Library::operator const void*() const
{
    return _impl->failed() ? 0 : this;
}


bool Library::operator!() const
{
    return _impl->failed() ? true : false;
}


const std::string& Library::path() const
{
    return _path;
}


std::string Library::suffix()
{
    return LibraryImpl::suffix();
}


std::string Library::prefix()
{
    return LibraryImpl::prefix();
}

} // namespace System

} // namespace Pt
