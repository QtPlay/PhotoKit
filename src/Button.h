#ifndef BUTTON_H
#define BUTTON_H

#include <QGraphicsWidget>

namespace PhotoKit {
class OutlineGlowItem;
class ButtonBackground;
class ButtonPrivate;
class Button : public QGraphicsWidget
{
    Q_OBJECT
	Q_DECLARE_PRIVATE(Button)
public:
    enum ButtonType { Text, Icon, CloseButton, PlayButton, PauseButton, StopButton, ArrowUp, ArrowDown, ArrowLeft, ArrowRight}; //use mirrored image
    enum State {ON = 1, OFF = 2, HIGHLIGHT = 4, DISABLED = 8};
    enum Shape { RectShape, RoundedRectShape};
	explicit Button(ButtonType type, Shape shape, QGraphicsItem * parent = 0, Qt::WindowFlags wFlags = 0);
	explicit Button(const QString& text, Shape shape, QGraphicsItem * parent = 0, Qt::WindowFlags wFlags = 0);
	explicit Button(const QPixmap& text, Shape shape, QGraphicsItem * parent = 0, Qt::WindowFlags wFlags = 0);
	virtual ~Button();

	void setCheckable(bool);
	bool isCheckable() const;

	bool isChecked() const;
	void setChecked(bool checked);

	void setDown(bool);
	bool isDown() const;

    void setText(const QString& text);
    QString text() const;
    void setIcon(const QIcon& icon);
    QPixmap icon() const;
    void setColor(const QColor& color);
    QColor color() const;

    virtual QRectF boundingRect() const;
    virtual void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget){
        Q_UNUSED(painter);
        Q_UNUSED(option);
        Q_UNUSED(widget);
    }
    //shape()

signals:
	void pressed();
	void released();
	void clicked(bool checked = false);
	void toggled(bool checked);

protected:
    void init();
    void setState(State state);
    void prepairBackgrounds();

	virtual void resizeEvent(QGraphicsSceneResizeEvent *event);
    //all accept to avoid event send to back items
    virtual void mousePressEvent(QGraphicsSceneMouseEvent *event);
    virtual void mouseReleaseEvent(QGraphicsSceneMouseEvent *event);
    virtual void mouseMoveEvent(QGraphicsSceneMouseEvent *event);
    virtual void hoverEnterEvent(QGraphicsSceneHoverEvent *event);
    virtual void hoverMoveEvent(QGraphicsSceneHoverEvent *event);
    virtual void hoverLeaveEvent(QGraphicsSceneHoverEvent *event);
private:
    bool prepared;
    ButtonType mType;
    Shape mShape;
    State mState;
    QString mText;
    QPixmap mIcon;
    ButtonBackground *mBgDisabled, *mBgHighlight, *mBgOn, *mBgOff;
    QGraphicsTextItem *mTextItem;
    QGraphicsPixmapItem *mIconItem;
    OutlineGlowItem *mGlow;
    QSize logicalSize;
    QColor mColor;

	ButtonPrivate *d_ptr;
};

} //namespace PhotoKit
#endif // BUTTON_H