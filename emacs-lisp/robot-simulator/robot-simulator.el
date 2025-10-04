;;; robot-simulator.el --- robot-simulator (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(cl-defstruct robot x y direction)

(defun create-robot (x y direction)
  "Create a robot using coordinates X and Y, facing DIRECTION."
  (make-robot :x x :y y :direction direction))

(defun move-robot (robot instruction)
  "Move the ROBOT acording to INSTRUCTION."
  (pcase instruction
    (?R (pcase (robot-direction robot)
          ('north (create-robot (robot-x robot) (robot-y robot) 'east))
          ('east (create-robot (robot-x robot) (robot-y robot) 'south))
          ('south (create-robot (robot-x robot) (robot-y robot)'west))
          ('west (create-robot (robot-x robot) (robot-y robot) 'north))))
    (?L (pcase (robot-direction robot)
          ('north (create-robot (robot-x robot) (robot-y robot) 'west))
          ('east (create-robot (robot-x robot) (robot-y robot) 'north))
          ('south (create-robot (robot-x robot) (robot-y robot) 'east))
          ('west (create-robot (robot-x robot) (robot-y robot) 'south))))
    (?A (pcase (robot-direction robot)
          ('north (create-robot (robot-x robot) (1+ (robot-y robot)) 'north))
          ('east (create-robot (1+ (robot-x robot)) (robot-y robot) 'east))
          ('south (create-robot (robot-x robot) (1- (robot-y robot)) 'south))
          ('west (create-robot (1- (robot-x robot)) (robot-y robot) 'west))))
    (_ (error "Unknown instruction %s" instruction))))

(defun move (robot instructions)
  "Make ROBOT follow all INSTRUCTIONS."
  (seq-reduce (lambda (robot instruction) (move-robot robot instruction))
              (string-to-list instructions)
              robot))


(provide 'robot-simulator)
;;; robot-simulator.el ends here
