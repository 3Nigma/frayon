/***************************************************************************
 *   Copyright (C) 2006-2008 Marc Boris Duerner                            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Library General Public License as       *
 *   published by the Free Software Foundation; either version 2 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Library General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
#ifndef PT_LIBRARYIMPL_H
#define PT_LIBRARYIMPL_H

#include "Pt/System/IOError.h"
#include <string>
#include <dlfcn.h>

namespace Pt {

namespace System {

class LibraryImpl
{
    public:
        LibraryImpl()
        : _refs(1)
        , _handle(0)
        { }

        LibraryImpl(const std::string& path)
        : _refs(1)
        , _handle(0)
        {
            this->open(path);
        }

        ~LibraryImpl()
        {
            if(_handle)
                ::dlclose(_handle);
        }

        unsigned refs() const
        {
            return _refs;
        }

        unsigned ref()
        {
            return ++_refs;
        }

        unsigned unref()
        {
            return --_refs;
        }

        void open(const std::string& path);

        void close();

        void* resolve(const char* symbol) const;

        bool failed()
        { return _handle == 0; }

        static std::string suffix()
        {
            return ".so";
        }

        static std::string prefix()
        {
            return "lib";
        }

    private:
        unsigned _refs;
        void* _handle;
};

} // namespace System

} // namespace Pt

#endif
