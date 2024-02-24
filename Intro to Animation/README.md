# What i learn from code with andrea

# Intro for Animation

Explicit and implicit type of animation

| Explicit Animation | Implicit Animation |
| --- | --- |
| more control(using AnimationController) | less Control, easier to Create |
| more difficult to use | Custom or built-in animation |
| -start/stop , go forward and reverse | Animation always go forwards , don’t repeat forever |
|  |  |

❗ **Explicit** are good for interactivity (like gesture detector)

| Built-in Widget | Custom |
| --- | --- |
| animatedContainer, OpacityContainer | tweenAnimationBuilder |

🎨 important to use curves to make it real

2)**tweenAnimationBuilder**

Tween the range of value i want to iterates

- tween<offset> to move widgets
- tween<color> to change color of widget

builder what you’re widget will look like
