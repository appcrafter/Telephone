//
//  SucceedingReceiptRefreshRequestStub.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//  Copyright (c) 2016 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import UseCases

final class SucceedingReceiptRefreshRequestStub {
    private let receipt: Receipt
    private let target: ReceiptRefreshRequestTarget

    init(receipt: Receipt, target: ReceiptRefreshRequestTarget) {
        self.receipt = receipt
        self.target = target
    }
}

extension SucceedingReceiptRefreshRequestStub: ReceiptRefreshRequest {
    func start() {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(1.0) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.target.didRefreshReceipt(self.receipt)
        }
    }
}