//
//  MGSwipeableTabBarController.swift
//  MGSwipeableTabBarController
//
//  Created by Marcos Griselli on 1/26/17.
//  Copyright © 2017 Marcos Griselli. All rights reserved.
//

import UIKit

/// `UITabBarController` subclass with a `selectedViewController` property observer,
/// `SwipeInteractor` that handles the swiping between tabs gesture, and a `SwipeTransitioningProtocol`
/// that determines the animation to be added. Use it or subclass it.
open class SwipeableTabBarController: UITabBarController {

    // MARK: - Private API
    fileprivate var swipeInteractor: SwipeInteractor!
    fileprivate var swipeAnimatedTransitioning: SwipeTransitioningProtocol!
    private let kSelectedViewControllerKey = "selectedViewController"

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    private func setup() {
        // Set the interactor that will handle the swipes
        swipeInteractor = SwipeInteractor()
        swipeInteractor.onfinishTransition = {
            if let controllers = self.viewControllers {
                self.selectedViewController = controllers[self.selectedIndex]
            }
        }
        // Set the animation to excecute with swipe percentage
        swipeAnimatedTransitioning = SwipeAnimation()

        // UITabBarControllerDelegate for transitions.
        delegate = self

        // Observe selected index changes to wire the gesture recognizer to the viewController.
        addObserver(self, forKeyPath: kSelectedViewControllerKey, options: .new, context: nil)
    }
    
    // MARK: - Public API
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // .selectedViewController changes so we setup the swipe interactor to the new selected Controller.
        if keyPath == kSelectedViewControllerKey {
            if let selectedController = selectedViewController {
                swipeInteractor.wireTo(viewController: selectedController.firstController())
            }
        }
    }

    /// Modify the swipe animation, it can be one of the default `SwipeAnimationType` or your own type
    /// conforming to `SwipeAnimationTypeProtocol`.
    ///
    /// - Parameter type: object conforming to `SwipeAnimationTypeProtocol`.
    open func setSwipeAnimation(type: SwipeAnimationTypeProtocol) {
        swipeAnimatedTransitioning.animationType = type
    }

    /// Modify the transitioning animation.
    ///
    /// - Parameter animation: UIViewControllerAnimatedTransitioning conforming to 
    /// `SwipeTransitioningProtocol`.
    open func setAnimationTransitioning(animation: SwipeTransitioningProtocol) {
        swipeAnimatedTransitioning = animation
    }

    /// Toggle the diagonal swipe to remove the just `perfect` horizontal swipe interaction 
    /// needed to perform the transition.
    ///
    /// - Parameter enabled: Bool value to the corresponding diagnoal swipe support.
    open func setDiagonalSwipe(enabled: Bool) {
        swipeInteractor.isDiagonalSwipeEnabled = enabled
    }
    
    /// Enables/Disables swipes on the tabbar controller.
    open var isSwipeEnabled = true {
        didSet { swipeInteractor.isEnabled = isSwipeEnabled }
    }
}

// MARK: - UITabBarControllerDelegate
extension SwipeableTabBarController: UITabBarControllerDelegate {
    
    public func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        // Get the indexes of the ViewControllers involved in the animation to determine the animation flow. 
        guard let fromVCIndex = tabBarController.viewControllers?.index(of: fromVC),
              let toVCIndex   = tabBarController.viewControllers?.index(of: toVC) else {
                return nil
        }

        swipeAnimatedTransitioning.fromLeft = fromVCIndex > toVCIndex
        return swipeAnimatedTransitioning
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return swipeInteractor.interactionInProgress ? swipeInteractor : nil
    }
}
