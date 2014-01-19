/*
 * Copyright (C) 2008 Marc Boris Duerner
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

#ifndef Pt_Slot_h
#define Pt_Slot_h

#include <Pt/Api.h>
#include <Pt/Void.h>

namespace Pt {

class Connection;

class Slot 
{
    public:
        virtual ~Slot() {}

        virtual Slot* clone() const = 0;

        virtual const void* callable() const = 0;

        virtual void onConnect(const Connection& c) = 0;

        virtual void onDisconnect(const Connection& c) = 0;

        virtual bool equals(const Slot& slot) const = 0;
};

template < typename R, typename A1 = Void,  typename A2 = Void,
                       typename A3 = Void,  typename A4 = Void,
                       typename A5 = Void,  typename A6 = Void,
                       typename A7 = Void,  typename A8 = Void,
                       typename A9 = Void,  typename A10 = Void >
class BasicSlot : public Slot 
{
    public:
        virtual Slot* clone() const = 0;
};

} // namespace Pt

#endif
