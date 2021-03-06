/*
 * Copyright (C) 2006-2010 by Marc Boris Duerner
 * Copyright (C) 2010-2010 by Aloysius Indrayanto
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

#include <Pt/Atomicity.h>

#include <csignal>

namespace Pt {

atomic_t::atomic_t(int v)
: i32(v)
{}

int atomicGet(volatile atomic_t& val)
{
    asm volatile ( "" : : : "memory" );
    return val.i32;
}

void atomicSet(volatile atomic_t& val, int n)
{
    val.i32 = n;
    asm volatile ( "" : : : "memory" );
}

int atomicIncrement(volatile atomic_t& val)
{
    int tmp, result = 0;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    addu %1, %0, 1\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "    .set mips0\n"
                   : "=&r"(result), "=&r"(tmp), "=m"(val.i32)
                   :   "m"(val.i32));
    return result + 1;
}

int atomicDecrement(volatile atomic_t& val)
{
    int tmp, result = 0;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    subu %1, %0, 1\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "    .set mips0\n"
                   : "=&r"(result), "=&r"(tmp), "=m"(val.i32)
                   :   "m"(val.i32));
    return result - 1;
}

int atomicExchange(volatile atomic_t& val, int exch)
{
    int result, tmp;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    move %1, %4\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "    .set mips0\n"
                   : "=&r"(result),  "=&r"(tmp), "=m"(val.i32)
                   :   "m"(val.i32),   "r"(exch) );
    return(result);
}

int atomicCompareExchange(volatile atomic_t& val, int exch, int comp)
{
    int old, tmp;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    bne  %0, %5, 2f\n"
                   "    move %1, %4\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "2:  .set mips0\n"
                   : "=&r"(old),    "=&r"(tmp),  "=m"(val.i32)
                   :   "m"(val.i32),  "r"(exch),  "r"(comp) );
    return(old);
}

int atomicExchangeAdd(volatile atomic_t& val, int add)
{
    int result, tmp;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    addu %1, %0, %4\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "    .set mips0\n"
                   : "=&r"(result),  "=&r"(tmp), "=m"(val.i32)
                   :   "m"(val.i32),   "r"(add) );
    return result;
}

void* atomicExchange(void* volatile& val, void* exch)
{
    void* result;
	void* tmp;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    move %1, %4\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "    .set mips0\n"
                   : "=&r"(result), "=&r"(tmp), "=m"(val)
                   :   "m"(val),      "r"(exch) );
    return(result);
}

void* atomicCompareExchange(void* volatile& val, void* exch, void* comp)
{
    void* old;
    void* tmp;

    asm volatile ( "    .set mips32\n"
                   "1:  ll   %0, %2\n"
                   "    bne  %0, %5, 2f\n"
                   "    move %1, %4\n"
                   "    sc   %1, %2\n"
                   "    beqz %1, 1b\n"
                   "2:  .set mips0\n"
                   : "=&r"(old), "=&r"(tmp),  "=m"(val)
                   :   "m"(val),   "r"(exch),  "r"(comp) );
    return(old);
}

} // namespace Pt
