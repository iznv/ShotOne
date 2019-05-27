//
//  TableDirector+Replace.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

extension TableDirector {
    
    func replace(with sections: [TableSection]) {
        clear()
        append(sections: sections)
        reload()
    }
    
}
