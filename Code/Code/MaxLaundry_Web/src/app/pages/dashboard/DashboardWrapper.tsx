import React, { FC } from 'react'
import { useIntl } from 'react-intl'
import { KTCard, KTCardBody, toAbsoluteUrl } from '../../../_metronic/helpers'
import { ScrollMenu, VisibilityContext, publicApiType } from 'react-horizontal-scrolling-menu';
import 'react-horizontal-scrolling-menu/dist/styles.css';


const elemPrefix = "test";
const getId = (index: number) => `${elemPrefix}${index}`;

const getItems = () =>
  Array(20)
    .fill(0)
    .map((_, ind) => ({ id: getId(ind) }));

const DashboardPage: FC = () => {
  const [items] = React.useState(getItems);
  // const { disableScroll, enableScroll } = usePreventBodyScroll();

  return (
    <>
      <KTCard>
        <KTCardBody>
          <ScrollMenu LeftArrow={LeftArrow} RightArrow={RightArrow}>
            {items.map(({ id }) => (
              <Card
                itemId={id}
                title={id}
              />
            ))}
          </ScrollMenu>
        </KTCardBody>
      </KTCard>
    </>
  )
}

const DashboardWrapper: FC = () => {
  const intl = useIntl()
  return (
    <>
      <DashboardPage />
    </>
  )
}

export { DashboardWrapper }


const LeftArrow = () => {
  const visibility = React.useContext<publicApiType>(VisibilityContext);
  const isFirstItemVisible = visibility.useIsVisible('first', true);
  return (
    <button
      disabled={isFirstItemVisible}
      onClick={() => visibility.scrollPrev}
      className="left"
    >
      Left
    </button>
  );
};


const RightArrow = () => {
  const visibility = React.useContext<publicApiType>(VisibilityContext);
  const isLastItemVisible = visibility.useIsVisible('last', false);
  return (
    <button
      disabled={isLastItemVisible}
      onClick={() => visibility.scrollNext}
      className="right"
    >
      Right
    </button>
  );
};


const Card = ({ title, itemId }: { title: string; itemId: string }) => {
  const visibility = React.useContext(VisibilityContext);
  const isVisible = visibility.useIsVisible(itemId, true);

  return (
    <>
      <a href="#" className="btn btn-flex btn-primary px-6">
        <span className="svg-icon svg-icon-2x"><svg>...</svg></span>
        <span className="d-flex flex-column align-items-start ms-2">
          <span className="fs-3 fw-bolder">{title}</span>
          <span className="fs-7">Some description</span>
        </span>
      </a>
    </>
  )
}
