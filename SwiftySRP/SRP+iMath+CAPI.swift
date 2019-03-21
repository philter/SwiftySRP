//
//  SRP+iMath+CAPI.swift
//  SwiftySRP
//
//  Created by Sergey Novitsky on 21/03/2019.
//  Copyright © 2019 Flock of Files. All rights reserved.
//

import Foundation

typealias mp_digit = UInt32
typealias mp_size = UInt32
typealias mp_sign = UInt8
typealias mp_result = Int32
typealias mp_small = Int /* must be a signed type */

struct mpz {
    public var single: mp_digit = 0
    public var digits: UnsafeMutablePointer<mp_digit>!
    public var alloc: mp_size = 0
    public var used: mp_size = 0
    public var sign: mp_sign = 0
}

typealias mpz_t = mpz
typealias mp_int = UnsafeMutablePointer<mpz>

@_silgen_name("mp_int_init") @discardableResult
func mp_int_init(_ z: mp_int!) -> mp_result

@_silgen_name("mp_int_init_value") @discardableResult
func mp_int_init_value(_ z: mp_int!, _ value: mp_small) -> mp_result

@_silgen_name("mp_int_read_const_unsigned") @discardableResult
func mp_int_read_const_unsigned(_ z: mp_int!, _ buf: UnsafePointer<UInt8>!, _ len: Int32) -> mp_result

@_silgen_name("mp_int_init_const_copy") @discardableResult
func mp_int_init_const_copy(_ z: mp_int!, _ old: UnsafePointer<mpz_t>!) -> mp_result

@_silgen_name("mp_int_unsigned_len") @discardableResult
func mp_int_unsigned_len(_ z: mp_int!) -> mp_result

@_silgen_name("mp_int_clear")
func mp_int_clear(_ z: mp_int!)

@_silgen_name("mp_int_to_unsigned") @discardableResult
func mp_int_to_unsigned(_ z: mp_int!, _ buf: UnsafeMutablePointer<UInt8>!, _ limit: Int32) -> mp_result

@_silgen_name("mp_int_count_bits") @discardableResult
func mp_int_count_bits(_ z: mp_int!) -> mp_result

@_silgen_name("mp_int_mul") @discardableResult
func mp_int_mul(_ a: mp_int!, _ b: mp_int!, _ c: mp_int!) -> mp_result /* c = a * b */

@_silgen_name("mp_int_add") @discardableResult
func mp_int_add(_ a: mp_int!, _ b: mp_int!, _ c: mp_int!) -> mp_result /* c = a + b */

@_silgen_name("mp_int_sub") @discardableResult
func mp_int_sub(_ a: mp_int!, _ b: mp_int!, _ c: mp_int!) -> mp_result /* c = a - b */

@_silgen_name("mp_int_exptmod") @discardableResult
func mp_int_exptmod(_ a: mp_int!, _ b: mp_int!, _ m: mp_int!, _ c: mp_int!) -> mp_result

@_silgen_name("mp_int_expt") @discardableResult
func mp_int_expt(_ a: mp_int!, _ b: mp_small, _ c: mp_int!) -> mp_result /* c = a^b */

@_silgen_name("mp_int_compare") @discardableResult
func mp_int_compare(_ a: mp_int!, _ b: mp_int!) -> Int32 /* a <=> b     */

@_silgen_name("mp_int_compare_zero") @discardableResult
func mp_int_compare_zero(_ z: mp_int!) -> Int32 /* a <=> 0  */

@_silgen_name("mp_int_mod") @discardableResult
func mp_int_mod(_ a: mp_int!, _ m: mp_int!, _ c: mp_int!) -> mp_result /* c = a % m */
